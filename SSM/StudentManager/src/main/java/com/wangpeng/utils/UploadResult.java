package com.wangpeng.utils;

import java.util.HashMap;

public class UploadResult extends ResultCode {

    /**
     * 成功
     * @param src 图片地址
     * @return
     */
    public static UploadResult success(String src, String fileName) {
        UploadResult result = new UploadResult();
        result.setCode(0);
        result.setMsg("成功");
        result.setData(new HashMap<String, String>() {
            {
                put("src", src);
                put("fileName", fileName);
            }
        });
        return result;
    }

}
