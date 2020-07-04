package kr.ac.knou.service.user;

import java.util.List;

import kr.ac.knou.dto.user.User;

public interface UserService
{
    //이메일 중복 확인
    public int getEmailCheck(String email) throws Exception;

    //닉네임 중복 확인
    public int getNicknameCheck(String nickname) throws Exception;

    //계정 생성
    public void signUp(User user) throws Exception;

    //이메일 인증확인
    public int getEmailConfirm(String email, String key) throws Exception;

    //로그인
    public User signIn(User user) throws Exception;

    //유저 상세정보 가저오기
    public User getFindById(int id) throws Exception;

    //유저 정보 수정
    public int getUserEdit(User user) throws Exception;

    //유저 리스트 보기
    public List<User> getReadUsers(String field, String query, int page) throws Exception;
}
