
tree_traversals(Tree, Preorder, Inorder) :-
    phrase(po(Tree), Preorder),
    phrase(io(Tree), Inorder).

po(nil) --> [].
po(node(L, E, R)) -->
    [E],
    po(L),
    po(R).

io(nil) --> [].
io(node(L, E, R)) -->
    io(L),
    [E],
    io(R).

