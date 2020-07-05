package kr.ac.knou.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.board.BoardDAO;
import kr.ac.knou.dto.board.Board;

@Service
public class BoardServiceImpl implements BoardService
{
    @Autowired
    BoardDAO boardDAO;

    @Override
    public List<Board> selectBoards() throws Exception
    {
        return boardDAO.selectBoards();
    }

    @Override
    public List<Board> selectBoards(String field, String query, int page) throws Exception
    {
        return boardDAO.selectBoards(field, query, page);
    }

    @Override
    public int selectBoardCount(String field, String query) throws Exception
    {
        // TODO Auto-generated method stub
        return boardDAO.selectBoardCount(field, query);
    }

    @Override
    public Board selectBoardForId(int id) throws Exception
    {
        return boardDAO.selectBoardForId(id);
    }
    
    @Override
    public void insertBoard(Board board) throws Exception
    {
        boardDAO.insertBoard(board);
    }

    @Override
    public void updateBoardHit(int id) throws Exception
    {
        boardDAO.updateBoardHit(id);
    }
    
}
