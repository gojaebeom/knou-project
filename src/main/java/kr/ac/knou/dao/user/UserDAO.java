package kr.ac.knou.dao.user;

import kr.ac.knou.dto.user.User;

public interface UserDAO
{
    //이메일 중복 확인
    public int getEmailCheck(String email) throws Exception;

    //닉네임 중복 확인
    public int getNicknameCheck(String nickname) throws Exception;
    
    //계정 생성
    public int signUp(User user) throws Exception; 

    //이메일 인증확인
    public int getEmailConfirm(String email, String key) throws Exception;

    //이메일 정식인증
    public int getAuthStatusUpdate(int id) throws Exception;

    //로그인
    public User signIn(User user) throws Exception;

    //유저 상세정보 가저오기
    public User getFindById(int id) throws Exception;

    //유저 정보 수정
    public int getUserEdit(User user) throws Exception;
}
