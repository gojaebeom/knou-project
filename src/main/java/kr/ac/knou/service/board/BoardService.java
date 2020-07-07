package kr.ac.knou.service.board;

import java.util.List;

import kr.ac.knou.dto.board.Board;

public interface BoardService
{

    public List<Board> selectBoards() throws Exception;

    public List<Board> selectBoards(String field, String query, int page)  throws Exception;
    
    public List<Board> selectBoardsForUserId(int userId) throws Exception;
    
    public List<Board> selectBoardsForUserId(int userId, int page) throws Exception;

    public int selectBoardCount(String field, String query) throws Exception;
    
    public int selectBoardCountForUserId(int id) throws Exception;

    public Board selectBoardForId(int id) throws Exception;

    public int insertBoard(Board board) throws Exception;

    public void updateBoardHit(int id) throws Exception;
    
    public int updateBoardCommentCnt(int id) throws Exception;
    
    public int updateBoardLikeCnt(int id) throws Exception;
    
    public int updateBoard(Board board) throws Exception;
    
    public int deleteBoard(int id) throws Exception;

    

}
