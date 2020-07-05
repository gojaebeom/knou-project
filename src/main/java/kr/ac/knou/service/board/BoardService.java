package kr.ac.knou.service.board;

import java.util.List;

import kr.ac.knou.dto.board.Board;

public interface BoardService
{

    public List<Board> selectBoards() throws Exception;

    public List<Board> selectBoards(String field, String query, int page)  throws Exception;

    public int selectBoardCount(String field, String query) throws Exception;

    public Board selectBoardForId(int id) throws Exception;

    public void insertBoard(Board board) throws Exception;

    public void updateBoardHit(int id) throws Exception;

}
