var slide=new Array();
  slide[0]="images/s1.jpg";
  slide[1]="images/s3.png";
  slide[2]="images/s2.webp";
function next() {
        // n++;
        // if (n == slide.length) {
        //   n = 0;
        // }
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        
      }
      function back() {
        // n--;
        // if (n < 0) {
        //   n = slide.length - 1;
        // }
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 3);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
      }

       $(document).ready(function () {
       var slide=new Array();
        slide[0]="images/s1.jpg";
        slide[1]="images/s3.png";
        slide[2]="images/s2.webp";
        setInterval(function () {
          var n = Math.floor(Math.random() * 3);
          if (n > slide.length - 1) {
            n = slide.length - 1;
          }
          $("#anh").fadeOut(function () {
            $("#anh").attr("src", slide[n]);
            $("#anh").fadeIn();
          });
        }, 2000);

      });
        $(document).ready(function () {
       var slide=new Array();
        slide[0]="images/gioithieu1.jpg";
        slide[1]="images/gioithieu2.jpg";
        slide[2]="images/gioithieu3.jpg";
        slide[3]="images/gioithieu4.jpg";
        setInterval(function () {
          var n = Math.floor(Math.random() * 4);
          if (n > slide.length - 1) {
            n = slide.length - 1;
          }
          $("#gt").fadeOut(function () {
            $("#gt").attr("src", slide[n]);
            $("#gt").fadeIn();
          });
        }, 3000);

      });
var list=new Array();
list[0]="images/g23.jpg";
list[1]="images/g22.jpg";
list[2]="images/g21.jpg";
list[3]="images/g20.jpg";
list[4]="images/g19.jpg";
list[5]="images/g18.jpg";
list[6]="images/g17.jpg";
list[7]="images/g16.jpg";
list[8]="images/g15.jpg";
list[9]="images/g14.jpg";
list[10]="images/g13.jpg";
list[11]="images/g12.jpg";
list[12]="images/g11.jpg";
list[13]="images/g10.jpg";
list[14]="images/g9.jpg";
list[15]="images/g8.jpg";
list[16]="images/g7.jpg";
list[17]="images/g6.jpg";
var n=0;
function onenext(){
   if(n==list.length)
   {
    n=0;
   }
   n++;
   document.getElementById("g1").setAttribute("src",list[n]);
};


var slide=new Array();
  slide[0]="images/gt1.jpg";
  slide[1]="images/gt2.jpg";
  slide[2]="images/gt3.jpg";
   slide[3]="images/gt4.jpg";
function nextt() {
        // n++;
        // if (n == slide.length) {
        //   n = 0;
        // }
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        
      }
      function backk() {
        // n--;
        // if (n < 0) {
        //   n = slide.length - 1;
        // }
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
      }

       $(document).ready(function () {
       var slide=new Array();
        slide[0]="images/gt1.jpg";
        slide[1]="images/gt2.jpg";
        slide[2]="images/gt3.jpg";
        slide[0]="images/gt4.jpg";
  
        setInterval(function () {
          var n = Math.floor(Math.random() * 4);
          if (n > slide.length - 1) {
            n = slide.length - 1;
          }
          $("#anhh").fadeOut(function () {
            $("#anhh").attr("src", slide[n]);
            $("#anhh").fadeIn();
          });
        }, 2000);

      });

       var slide=new Array();
  slide[0]="images/vs6.jpg";
  slide[1]="images/vs7.jpg";
  slide[2]="images/vs8.jpg";
  slide[3]="images/vs9.jpg";
function nexttt() {
        // n++;
        // if (n == slide.length) {
        //   n = 0;
        // }
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        
      }
      function backkk() {
        // n--;
        // if (n < 0) {
        //   n = slide.length - 1;
        // }
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
        document.getElementById("anhhh").setAttribute("src", slide[n]);
        var n = Math.floor(Math.random() * 4);
        if (n > slide.length - 1) {
          n = slide.length - 1;
        }
      }

       $(document).ready(function () {
       var slide=new Array();
        slide[0]="images/vs6.jpg";
        slide[1]="images/vs7.jpg";
        slide[2]="images/vs8.jpg";
        slide[0]="images/vs9.jpg";
  
        setInterval(function () {
          var n = Math.floor(Math.random() * 4);
          if (n > slide.length - 1) {
            n = slide.length - 1;
          }
          $("#anhhh").fadeOut(function () {
            $("#anhhh").attr("src", slide[n]);
            $("#anhhh").fadeIn();
          });
        }, 2000);

      });
