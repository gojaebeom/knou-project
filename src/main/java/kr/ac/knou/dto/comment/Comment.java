package kr.ac.knou.dto.comment;

import java.util.Date;

import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.user.User;

public class Comment
{
    private int id;
    private int boardId;   
    private int writerId;   
    private String content;   
    private Date createdAt;  
    private Date updatedAt;
    private User user;
    private Board board;
    
    public Comment()
    {
        
    }
    
    public Board getBoard()
    {
        return board;
    }

    public void setBoard(Board board)
    {
        this.board = board;
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
        return "Comment [id=" + id + ", boardId=" + boardId + ", writerId="
                + writerId + ", content=" + content + ", createdAt=" + createdAt
                + ", updatedAt=" + updatedAt + ", user=" + user + ", board="
                + board + "]";
    }
    
    
    
}
