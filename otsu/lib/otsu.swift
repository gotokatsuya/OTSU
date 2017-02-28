//
//  otsu.swift
//  otsu
//
//  Created by goka on 2017/02/26.
//  Copyright © 2017年 goto. All rights reserved.
//

func otsu(histogram: [Int], numPixels: Int) -> Int {
    var sum: Int = 0
    for i in 0..<256 {
        sum += i*histogram[i]
    }
    var sumB: Int = 0
    var wB: Int = 0
    var wF: Int = 0
    var varianceMax: Int = 0
    var threshold: Int = 0
    for i in 0 ..< 256 {
        wB += histogram[i]
        if wB == 0 {
            continue
        }
        wF = numPixels - wB
        if wF == 0 {
            break
        }
        
        sumB += i*histogram[i]
        
        let mB = sumB/wB
        let mF = (sum - sumB)/wF
        
        let varianceBetween = wB*wF*(mB - mF)*(mB - mF)
        
        if varianceBetween > varianceMax {
            varianceMax = varianceBetween
            threshold = i
        }
    }
    return threshold
}
