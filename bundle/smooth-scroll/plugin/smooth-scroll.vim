" Smooth Scroll
"
" Remamps 
"  <C-U>
"  <C-D>
"  <C-F>
"  <C-B>
"
" to allow smooth scrolling of the window. I find that quick changes of
" context don't allow my eyes to follow the action properly.
"
" The global variable g:scroll_factor changes the scroll speed.
"
"
" Written by Brad Phelan 2006
" http://xtargets.com
let g:scroll_factor = 80
function! SmoothScroll(dir, windiv, factor)
   let wh=winheight(0)
   let i=0
   while i < wh / (a:windiv * 2)
      let t1=reltime()
      let i = i + 1
      if a:dir=="d"
         normal 2j
      else
         normal 2k
      end
      redraw
      while 1
         let t2=reltime(t1,reltime())
         if t2[1] > g:scroll_factor * a:factor
            break
         endif
      endwhile
   endwhile
endfunction
map  :call SmoothScroll("d",2, 2)<CR>
map  :call SmoothScroll("u",2, 2)<CR>
