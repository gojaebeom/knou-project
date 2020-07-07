package kr.ac.knou.service.user;

import java.util.List;

import kr.ac.knou.dto.user.User;

public interface UserService
{

    //회원 리스트 
    public List<User> selectUsers(String field, String query, int page) throws Exception;
    
    //회원 상세보기
    public User selectUserForId(int id) throws Exception;

    //로그인 : 이메일(계정)에 해당하는 유저 칼럼 가저오기
    public User selectUserForEmail(User user) throws Exception;

    //회원가입 : 이메일 중복여부, 반환 값 : 이메일 있을 시 1 : 없으면 0
    public int selectUserIdForEmail(String email) throws Exception;

    //회원가입 : 닉네임 중복여부, 반환 값 : 닉네임 있을 시 1 : 없으면 0
    public int selectUserIdForNickname(String nickname) throws Exception;
    
    //회원가입, 이메일 보내기 : 회원생성 및 해당 이메일에 인증키 보냄 
    public void insertUserAndSendEmail(User user) throws Exception;

    //회원가입 : 이메일과 인증키가 일치하면 일치하는 해당 id를 보내고 그 id의 인증상태 1로 업데이트(정식 인증 완료)
    public int updateUserAuthStatusForCertifiedId(String email, String key) throws Exception;

    //회원 수정 
    public int updateUser(User user) throws Exception;

    //회원 사진 수정
    public int updateUserImage(User user) throws Exception;

    //회원 탈퇴
    public int deleteUser(int id) throws Exception;
}
