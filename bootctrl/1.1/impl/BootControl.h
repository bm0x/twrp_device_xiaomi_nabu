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

#pragma once

#include <android/hardware/boot/1.1/IBootControl.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>
#include <libboot_control_qti.h>

namespace android {
namespace hardware {
namespace boot {
namespace V1_1 {
namespace implementation {

using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::hardware::boot::V1_0::BoolResult;
using ::android::hardware::boot::V1_1::IBootControl;
using ::android::hardware::boot::V1_1::MergeStatus;

class BootControl : public IBootControl {
  public:
    bool Init();

    // Methods from ::android::hardware::boot::V1_0::IBootControl follow.
    Return<uint32_t> getNumberSlots() override;
    Return<uint32_t> getCurrentSlot() override;
    Return<void> markBootSuccessful(markBootSuccessful_cb _hidl_cb) override;
    Return<void> setActiveBootSlot(uint32_t slot, setActiveBootSlot_cb _hidl_cb) override;
    Return<void> setSlotAsUnbootable(uint32_t slot, setSlotAsUnbootable_cb _hidl_cb) override;
    Return<BoolResult> isSlotBootable(uint32_t slot) override;
    Return<BoolResult> isSlotMarkedSuccessful(uint32_t slot) override;
    Return<void> getSuffix(uint32_t slot, getSuffix_cb _hidl_cb) override;

    // Methods from ::android::hardware::boot::V1_1::IBootControl follow.
    Return<bool> setSnapshotMergeStatus(MergeStatus status) override;
    Return<MergeStatus> getSnapshotMergeStatus() override;

};

extern "C" IBootControl* HIDL_FETCH_IBootControl(const char* name);

}  // namespace implementation
}  // namespace V1_1
}  // namespace boot
}  // namespace hardware
}  // namespace android
