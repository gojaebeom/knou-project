package kr.ac.knou.dao.board;

import java.util.List;

import kr.ac.knou.dto.board.Board;

public interface BoardDAO
{
    public void getBoardCreate(Board board) throws Exception;

    public List<Board> getBoardReadList() throws Exception;
    
    public List<Board> getBoardReadList(String field, String query, int page) throws Exception;
    
    public int getBoardReadCount(String field, String query) throws Exception;

    public Board getBoardReadOne(int id) throws Exception;

    public void getBoardUpdateHit(int id) throws Exception;
}
