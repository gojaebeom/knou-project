package kr.ac.knou.dto.user;

import java.util.Date;

public class User
{
    private int id; //PK
    private String email; //이메일 
    private String password; //비밀번호
    private String nickname; //닉네임
    private String image; //이미지
    private String authKey; //회원가입 인증토큰
    private int authStatus; //회원가입 인증토큰 비교후 업데이트
    private int role; //관리자 채크
    private Date createdAt; //생성일
    private Date updatedAt; //수정일
    
    public User()
    {
        
    }
    
    public User(int id, String email, String password, String nickname,
            String image, String authKey, int authStatus, int role,
            Date createdAt, Date updatedAt)
    {
        super();
        this.id = id;
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.image = image;
        this.authKey = authKey;
        this.authStatus = authStatus;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getNickname()
    {
        return nickname;
    }

    public void setNickname(String nickname)
    {
        this.nickname = nickname;
    }

    public String getImage()
    {
        return image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    public String getAuthKey()
    {
        return authKey;
    }

    public void setAuthKey(String authKey)
    {
        this.authKey = authKey;
    }

    public int getAuthStatus()
    {
        return authStatus;
    }

    public void setAuthStatus(int authStatus)
    {
        this.authStatus = authStatus;
    }

    public int getRole()
    {
        return role;
    }

    public void setRole(int role)
    {
        this.role = role;
    }

    public Date getCreatedAt()
    {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt()
    {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt)
    {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString()
    {
        return "User [id=" + id + ", email=" + email + ", password=" + password
                + ", nickname=" + nickname + ", image=" + image + ", authKey="
                + authKey + ", authStatus=" + authStatus + ", role=" + role
                + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
    }

}
