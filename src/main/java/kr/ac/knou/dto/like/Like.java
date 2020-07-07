package kr.ac.knou.dto.like;

import java.util.Date;

public class Like
{
    private int id;
    private int boardId;
    private int userId;
    private Date createdAt;
    
    public Like()
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

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public Date getCreatedAt()
    {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt)
    {
        this.createdAt = createdAt;
    }

    @Override
    public String toString()
    {
        return "Like [id=" + id + ", boardId=" + boardId + ", userId=" + userId
                + ", createdAt=" + createdAt + "]";
    }
    
    
}
