; 1.1
(caddr '(apple orange pear grapefruit))
(car(cdr(cdr '(apple orange pear grapefruit))))

;1.2
(caadr '((apple orange) (pear grapefruit)))
(car(car(cdr '((apple orange) (pear grapefruit)))))

;1.3
(car (caddar '(((apple) (orange) (pear) (grapefruit))))) ;PEARだけを含むリストを取り出すまでと、そこからPEARを取り出すまでを分けている
(car(car(cdr(cdr(car '(((apple) (orange) (pear) (grapefruit))))))))

;1.4
(caar (caddar '((apple (orange) ((pear)) (((grapefruit))))))) ;PEARだけを含むリストを取り出すまでと、そこからPEARを取り出すまでを分けている
(car(car(car(cdr(cdr(car '((apple (orange) ((pear)) (((grapefruit)))))))))))

;1.5
(car (caddr '((((apple))) ((orange)) (pear) grapefruit))) ;PEARだけを含むリストを取り出すまでと、そこからPEARを取り出すまでを分けている
(car(car(cdr(cdr '((((apple))) ((orange)) (pear) grapefruit)))))

;1.6
(cadar '((((apple) orange) pear) grapefruit))
(car(cdr(car '((((apple) orange) pear) grapefruit))))
