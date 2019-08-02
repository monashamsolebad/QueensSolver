//
//  main.swift
//  QueensSolver
//
//  Created by Mona Shamsolebad on 2019-08-01.
//  Copyright © 2019 Mona Shamsolebad. All rights reserved.
//

import Foundation

var count = 0
func solveQueens(board: inout Board, currentCol: Int) -> Bool {
    count += 1
    
    if currentCol == board.size {
        return true
    }
    
    var row = 0
    if (currentCol == 0) {
        row = Int.random(in: 0..<board.size)
    }
    while (row < board.size) {
        
        if (board.isSafe(row: row, col: currentCol)){
            board.place(row: row, col: currentCol)
            let nextColSafe = solveQueens(board: &board, currentCol: currentCol + 1)
            if (nextColSafe){
                return true
            }
            else{
                board.remove(row: row, col: currentCol)
            }
        }
        row += 1
    }
    
    return false
}


var board = Board(size: 8)
let found = solveQueens(board: &board, currentCol: 0)
print(count)
print(board.description)

