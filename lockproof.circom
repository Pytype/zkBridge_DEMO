pragma circom 2.0.0;

include "./circuits/keccak.circom";

template LockProof() {
    signal input user[160];        // address = 160 bits
    signal input amount[256];      // amount = 256 bits
    signal input expectedHash[256]; // keccak256 output = 256 bits
    signal output isValid;

    // 160 + 256 = 416 bits 입력
    signal packed[416];
    for (var i = 0; i < 160; i++) {
        packed[i] <== user[i];
    }
    for (var i = 0; i < 256; i++) {
        packed[160 + i] <== amount[i];
    }

    component hasher = Keccak(416, 256);
    for (var i = 0; i < 416; i++) {
        hasher.in[i] <== packed[i];
    }

    // 비교
    signal diff[256];
    signal isEqual[256];
    for (var i = 0; i < 256; i++) {
        diff[i] <== hasher.out[i] - expectedHash[i];
        isEqual[i] <== 1 - diff[i] * diff[i];
    }

    component acc = MultiAND(256);
    for (var i = 0; i < 256; i++) {
        acc.in[i] <== isEqual[i];
    }

    isValid <== acc.out;
}

component main = LockProof();
