/*
 * Copyright (c) 2020, The Linux Foundation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of The Linux Foundation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#define LOG_TAG "android.hardware.boot@1.1-impl-qti"

#include <memory>

#include <log/log.h>

#include "BootControl.h"

namespace android {
namespace hardware {
namespace boot {
namespace V1_1 {
namespace implementation {

using ::android::hardware::boot::V1_0::CommandResult;

bool BootControl::Init() {
    return bootcontrol_init();
}

Return<uint32_t> BootControl::getNumberSlots() {
    return get_number_slots();
}

Return<uint32_t> BootControl::getCurrentSlot() {
    return get_current_slot();
}

Return<void> BootControl::markBootSuccessful(markBootSuccessful_cb _hidl_cb) {
    int ret = mark_boot_successful();
    struct CommandResult cr;
    cr.success = (ret == 0);
    cr.errMsg = strerror(-ret);
    _hidl_cb(cr);
    return Void();
}

Return<void> BootControl::setActiveBootSlot(uint32_t slot, setActiveBootSlot_cb _hidl_cb) {
    int ret = set_active_boot_slot(slot);
    struct CommandResult cr;
    cr.success = (ret == 0);
    cr.errMsg = strerror(-ret);
    _hidl_cb(cr);
    return Void();
}

Return<void> BootControl::setSlotAsUnbootable(uint32_t slot, setSlotAsUnbootable_cb _hidl_cb) {
    int ret = set_slot_as_unbootable(slot);
    struct CommandResult cr;
    cr.success = (ret == 0);
    cr.errMsg = strerror(-ret);
    _hidl_cb(cr);
    return Void();
}

Return<BoolResult> BootControl::isSlotBootable(uint32_t slot) {
    int32_t ret = is_slot_bootable(slot);
    if (ret < 0) {
        return BoolResult::INVALID_SLOT;
    }
    return ret ? BoolResult::TRUE : BoolResult::FALSE;
}

Return<BoolResult> BootControl::isSlotMarkedSuccessful(uint32_t slot) {
    int32_t ret = is_slot_marked_successful(slot);
    if (ret < 0) {
        return BoolResult::INVALID_SLOT;
    }
    return ret ? BoolResult::TRUE : BoolResult::FALSE;
}

Return<void> BootControl::getSuffix(uint32_t slot, getSuffix_cb _hidl_cb) {
    hidl_string ans;
    const char* suffix = get_suffix(slot);
    if (suffix) {
        ans = suffix;
    }
    _hidl_cb(ans);
    return Void();
}

Return<bool> BootControl::setSnapshotMergeStatus(MergeStatus status) {
    return set_snapshot_merge_status(status);
}

Return<MergeStatus> BootControl::getSnapshotMergeStatus() {
    return get_snapshot_merge_status();
}

IBootControl* HIDL_FETCH_IBootControl(const char* /* hal */) {
    auto module = std::make_unique<BootControl>();
    if (!module->Init()) {
        ALOGE("Could not initialize BootControl module");
        return nullptr;
    }
    return module.release();
}

}  // namespace implementation
}  // namespace V1_1
}  // namespace boot
}  // namespace hardware
}  // namespace android
