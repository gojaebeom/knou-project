package kr.ac.knou.dao.user;

import java.util.List;

import kr.ac.knou.dto.user.User;

public interface UserDAO
{
    //유저 리스트 가저오기
    public List<User> selectUsers(String query, int page) throws Exception;
    
    //회원 리스트 총 유저 수 
    public int selectUserCount(String query) throws Exception;
    
    //유저 상세정보 가저오기
    public User selectUserForId(int id) throws Exception;
    
    //로그인 : email을 통해 유저 정보가저오기
    public User selectUserForEmail(User user) throws Exception;
    
    //회원가입 : 이메일 중복 확인
    public int selectUserIdForEmail(String email) throws Exception;

    //회원가입 : 닉네임 중복 확인
    public int selectUserIdForNickname(String nickname) throws Exception;
    
    //회원가입 : 이메일 인증된 아이디값 가져오기
    public int selectUserCertifiedId(String email, String key) throws Exception;
    
    //회원가입 : 계정 생성
    public int insertUser(User user) throws Exception; 

    //회원가입 : 이메일과 인증키가 일치하면 정식인증 ok
    public int updateUserAuthStatus(int id) throws Exception;
    
    //비밀번호 변경 : 회원의 인증키를 새로 발급 업데이트
    public int updateUserAuthKey(User user) throws Exception;
    
    //비밀번호 변경 :
    public int updateUserPassword(User user) throws Exception;

    //유저 정보 수정
    public int  updateUser(User user) throws Exception;

    //회원 사진 업데이트
    public int updateUserImage(User user) throws Exception;
    
    //회원 탈퇴
    public int deleteUser(int id) throws Exception;
}
