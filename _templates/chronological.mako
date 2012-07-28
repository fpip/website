<%inherit file="standard_page.mako" />

%for post in posts:
<%include file="post_excerpt.mako" args="post=post" />
%endfor

<div class="pagination">
    <div class="wp-pagenavi">
    %if prev_link:
     <a href="${prev_link}">« Previous Page</a>
    %endif
    %if next_link:
     <a href="${next_link}">Next Page »</a>
    % endif
    </div>
</div><!-- .pagination -->

