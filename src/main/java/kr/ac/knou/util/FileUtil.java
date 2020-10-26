package kr.ac.knou.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.knou.dto.user.User;

public class FileUtil
{
    private static final Log LOG = LogFactory.getLog(FileUtil.class);
    
    //private static final String PATH = "/home/images/upload-image";//개발 path
    
    private static final String PATH = "/home/ubuntu/knou-upload-images";//배포 path
    
    public static User imageUpload(MultipartFile imgFile)
    {
        LOG.info(imgFile.getOriginalFilename());
        
        //중복 방지 코드 생성
        UUID uuid = UUID.randomUUID();
        
        //기존의 이름 앞에 랜덤코드를 붙여줌
        String saveName = uuid + "_" + imgFile.getOriginalFilename();
        //지정된 경로에 바뀐 이름으로 저장할 파일 지정
        File saveFile = new File(PATH,saveName);
        
        try {
            //실제제로 파일을 저장
            imgFile.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }        
        
        User user = new User();
        user.setImage(saveName);
        
        return user;
    }
}
