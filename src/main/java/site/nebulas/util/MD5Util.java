package site.nebulas.util;

import org.apache.commons.codec.binary.Hex;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Administrator on 2016/11/29.
 */
public class MD5Util {
    public static void main(String[] args) {
        String str = "666666";
        System.out.println("待加密串：" + str);
        System.out.println("加密结果：" + encode(str));
    }

    public static String encode(String str){
        MessageDigest md = null;
        String res = "";
        try {
            md = MessageDigest.getInstance("MD5");
            byte[] md5Bytes = md.digest(str.getBytes());
            res = Hex.encodeHexString(md5Bytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return res;
    }
}
