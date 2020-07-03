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
    public void getBoardCreate(Board board) throws Exception
    {
        boardDAO.getBoardCreate(board);
    }

    @Override
    public List<Board> getBoardReadList() throws Exception
    {
        return boardDAO.getBoardReadList();
    }

    @Override
    public List<Board> getBoardReadList(String field, String query, int page) throws Exception
    {
        return boardDAO.getBoardReadList(field, query, page);
    }

    @Override
    public int getBoardReadCount(String field, String query) throws Exception
    {
        // TODO Auto-generated method stub
        return boardDAO.getBoardReadCount(field, query);
    }

    @Override
    public Board getBoardReadOne(int id) throws Exception
    {
        return boardDAO.getBoardReadOne(id);
    }

    @Override
    public void getBoardUpdateHit(int id) throws Exception
    {
        boardDAO.getBoardUpdateHit(id);
    }
    
}
