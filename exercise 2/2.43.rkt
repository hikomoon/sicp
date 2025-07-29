(flatmap
    (lambda (new-row)
        (map (lambda (rest-of-queens)
                (adjoin-position 
                    new-row k rest-of-queens))
                (queen-cols (- k 1))))
    (enumerate-interval 1 board-size))

 对比不难发现，对于棋盘 N, 这种写法每次都会多重复 N-1 次调用 queen-cols
 如果说原来的时间复杂度是 O(N!)
 那么现在时间复杂度就是 O(N^N)

 