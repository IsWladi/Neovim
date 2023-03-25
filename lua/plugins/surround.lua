return{
{'tpope/vim-surround',
  dependencies = {
    {'tpope/vim-repeat'}

}
}
}
--doc

--  Old text                  Command     New text ~
--  "Hello *world!"           ds"         Hello world!
--  [123+4*56]/2              cs])        (123+456)/2
--  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
--  if *x>3 {                 ysW(        if ( x>3 ) {
--  my $str = *whee!;         vllllS'     my $str = 'whee!';

--  Old text                  Command           New text ~
--  "hello"                   ysWfprint<cr>     print("hello")
--  "hello"                   ysWFprint<cr>     print( "hello" )
--  "hello"                   ysW<C-f>print<cr> (print "hello")
 


