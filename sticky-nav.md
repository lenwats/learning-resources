# Sticky nav

## Description
A fixed position sticky navigation in jQuery and CSS

</br>

### jQuery
  - ```
    <script>	
    // get the element
    var $navBar = document.getElementsByClassName('header')[0];

    // find original navigation bar position
    //var navPos = $navBar.offset().top; 
    var navPos = $navBar.offsetTop;

    $navBar.parentElement.classList.add('nav-wrapper');

    // on scroll
    $(window).scroll(function () {

        // get scroll position from top of the page
        var scrollPos = $(this).scrollTop();

        // check if scroll position is >= the nav position
        if (scrollPos > navPos) {
            $navBar.classList.add('navbar-fixed');
        } else {
            $navBar.classList.remove('navbar-fixed');
        }

    });
    </script>
    ```


</br>

### CSS
  - ```
    .nav-wrapper {
        height: 140px;
        position: unset;
        width: 100%;
        z-index: 99;
    }
    @media screen and (max-width: 767px) {
        .nav-wrapper {
            height: 96px; 
        }
    }
    .navbar-fixed {
        position: fixed;
        animation: easeNavIn 0.5s ease-in-out;
        min-height: 100px;
        width: 100%;
        z-index: 9999;
    }
    ```