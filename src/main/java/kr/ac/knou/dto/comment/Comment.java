package kr.ac.knou.dto.comment;

import java.util.Date;

import kr.ac.knou.dto.user.User;

public class Comment
{
    private int id;
    private int boardId;   
    private int writerId;   
    private String content;   
    private Date createdAt;  
    private User user;
    
    
    @Override
    public String toString()
    {
        return "Comment [id=" + id + ", boardId=" + boardId + ", writerId="
                + writerId + ", content=" + content + ", createdAt=" + createdAt
                + ", user=" + user + "]";
    }
    
    

    public Comment(int id, int boardId, int writerId, String content,
            Date createdAt, User user)
    {
        super();
        this.id = id;
        this.boardId = boardId;
        this.writerId = writerId;
        this.content = content;
        this.createdAt = createdAt;
        this.user = user;
    }

    public Comment()
    {
        
    }


    public int getId()
    {
        return id;
    }
    
    public void setId(int id)
    {
        this.id = id;
    }
    
    public int getBoardId()
    {
        return boardId;
    }
    
    public void setBoardId(int boardId)
    {
        this.boardId = boardId;
    }
    
    public int getWriterId()
    {
        return writerId;
    }
    
    public void setWriterId(int writerId)
    {
        this.writerId = writerId;
    }
    
    public String getContent()
    {
        return content;
    }
    
    public void setContent(String content)
    {
        this.content = content;
    }
    
    public Date getCreatedAt()
    {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }
    
    public User getUser()
    {
        return user;
    }
    
    public void setUser(User user)
    {
        this.user = user;
    }
    
}
