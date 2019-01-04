package com.zrtjoa.util;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @Auther: zwy
 * @Date: 2018/11/20 10:07
 * @Description:  文件下载
 */
public class DownloadFile {

    public static void downLoad(HttpServletResponse response) throws Exception {
        try {
            GenerateWord generateWord = new GenerateWord();
            String filePath = generateWord.createWord();
            // path是指欲下载的文件的路径。
            File file = new File(filePath);
            // 取得文件名。
            String filename = file.getName();
            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(filePath));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
