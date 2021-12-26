$(function () {
  let height = 25.5;
  var newRadius = 20;
  var radius = 20;
  var svgSize = 50;
  newRadius = $(window).width() * radius / 1920;
  $('circle').attr('r', newRadius);
  $('circle').attr('stroke-width', newRadius * 6.6 / 20);
  $('circle').attr('r', newRadius);
  $('circle').attr('stroke-width', newRadius * 6.6 / 20);
  var newSvgSize = $(window).width() * svgSize / 1920;
  $('svg').attr('width', newSvgSize);
  $('svg').attr('height', newSvgSize);
  $('circle').attr('cx', newSvgSize / 2);
  $('circle').attr('cy', newSvgSize / 2);
  $('circle').css('transform', 'unset');

  $(window).resize(function() {
    newRadius = $(window).width() * radius / 1920;
    $('circle').attr('r', newRadius);
    $('circle').attr('stroke-width', newRadius * 6.6 / 20);
    var newSvgSize = $(window).width() * svgSize / 1920;
    $('svg').attr('width', newSvgSize);
    $('svg').attr('height', newSvgSize);
    $('circle').attr('cx', newSvgSize / 2);
    $('circle').attr('cy', newSvgSize / 2);
    $('circle').css('transform', 'unset');
  });

  window.addEventListener("message", function (event) {
    if (event.data.open === 1) 
    {
      $(".barOxy").removeClass("hidden")
    }
    else
    {
      if ((event.data.varSetOxy >= 25 && event.data.hasOxygenTank === false) || (event.data.varSetOxy >= 100 && event.data.hasOxygenTank === true))
      {
        $(".barOxy").addClass("hidden")
      }
    }


    setProgressZentih(event.data.varSetOxy,'.progress-oxygen')
    if (event.data.type == "updateStatusHud") {
      $("#varSetHealth")
        .find(".progressBar")
        .attr("style", "width: " + event.data.varSetHealth + "%;");
      $("#varSetArmor")
        .find(".progressBar")
        .attr("style", "width: " + event.data.varSetArmor + "%;");

      widthHeightSplit(
        event.data.varSetHunger,
        $("#varSetHunger").find(".progressBar")
      );
      widthHeightSplit(
        event.data.varSetThirst,
        $("#varSetThirst").find(".progressBar")
      );
      widthHeightSplit(
        event.data.varSetOxy,
        $("#varSetOxy").find(".progressBar")
      );
      widthHeightSplit(
        event.data.varSetStress,
        $("#varSetStress").find(".progressBar")
      );

      let voice = event.data.varSetVoice;
      $(".voice1").addClass("hidden");
      $(".voice2").addClass("hidden");
      $(".voice3").addClass("hidden");
      $(".dev").addClass("hidden");
      $(".devDebug").addClass("hidden");
      if (voice == 1) {
        $(".voice1").removeClass("hidden");
      }
      if (voice == 2) {
        $(".voice2").removeClass("hidden");
        $(".voice3").removeClass("hidden");
      }
      if (voice == 3) {
        $(".voice1").removeClass("hidden");
        $(".voice2").removeClass("hidden");
        $(".voice3").removeClass("hidden");
      }
      if (event.data.varDev == true) {
        $(".dev").removeClass("hidden");
      }
      if (event.data.varDevDebug == true) {
        $(".devDebug").removeClass("hidden");
      }
      if (event.data.hasParachute == true) {
        $("#parachute").removeClass("hidden");
      } else {
        $("#parachute").addClass("hidden");
      }

      changeColor($(".progress-health"), event.data.varSetHealth, false)
      changeColor($(".progress-armor"), event.data.varSetArmor, false)
      changeColor($(".progress-burger"), event.data.varSetHunger, false)
      changeColor($(".progress-water"), event.data.varSetThirst, false)
      changeColor($(".progress-oxygen"), event.data.varSetOxy, false)
      changeColor($(".progress-stress"), event.data.varSetStress, true)
      setProgressZentih(event.data.varSetHealth,'.progress-health')
      setProgressZentih(event.data.varSetHunger,'.progress-burger')
      setProgressZentih(event.data.varSetThirst,'.progress-water')
      setProgressZentih(event.data.varSetArmor,'.progress-armor')            
      setProgressZentihStress(event.data.varSetStress,'.progress-stress')

      if (event.data.varSetArmor <= 0) {
        $("#varSetArmor").find(".barIcon").removeClass("danger");
      }

      if (event.data.colorblind === true) {
        $(".progressBar").addClass("colorBlind");
      } else {
        $(".progressBar").removeClass("colorBlind");
      }
    } else if (event.data.type == "talkingStatus") {
      if (event.data.is_talking) {
        $(".voice").addClass("talking");
      } else {
        $(".voice").removeClass("talking");
      }
    } else if (event.data.type == "transmittingStatus") {
      if (event.data.is_transmitting) {
        $(".voice").addClass("transmitting");
      } else {
        $(".voice").removeClass("transmitting");
      }
    }
  });

  function widthHeightSplit(value, ele) {
    let eleHeight = (value / 100) * height;
    let leftOverHeight = height - eleHeight;

    ele.attr(
      "style",
      "height: " + eleHeight + "px; top: " + leftOverHeight + "px;"
    );
  }

  function changeColor(ele, value, flip) {
    let add = false;
    if (flip) {
      if (value > 85) {
        add = true;
      }
    } else {
      if (value < 25) {
        add = true;
      }
    }

    if (add) {
      // ele.find(".barIcon").addClass("danger")
      ele.find(".progressBar").addClass("dangerGrad");
    } else {
      // ele.find(".barIcon").removeClass("danger")
      ele.find(".progressBar").removeClass("dangerGrad");
    }
  }
});


function setProgressZentih(value, element){
  var circle = document.querySelector(element);
  var radius = circle.r.baseVal.value;
  var circumference = radius * 2 * Math.PI;
  var html = $(element).parent().parent().find('span');
  var percent = value*100/100;

  circle.style.strokeDasharray = `${circumference} ${circumference}`;
  circle.style.strokeDashoffset = `${circumference}`;

  const offset = circumference - ((-percent*99)/100) / 100 * circumference;
  circle.style.strokeDashoffset = -offset;
  circle.style.transform = 'rotate(140deg)';

  var predkosc = Math.floor(value * 1.8)
  if (predkosc == 81 || predkosc == 131) {
    predkosc = predkosc - 1
  }

  html.text(predkosc);
}


function setProgressZentihStress(value, element){
  var circle = document.querySelector(element);
  var radius = circle.r.baseVal.value;
  var circumference = radius * 2 * Math.PI;
  var html = $(element).parent().parent().find('span');
  var percent = value*132/100;

  circle.style.strokeDasharray = `${circumference} ${circumference}`;
  circle.style.strokeDashoffset = `${circumference}`;

  const offset = circumference - ((-percent*99)/100) / 100 * circumference;
  circle.style.strokeDashoffset = -offset;
  circle.style.transform = 'rotate(140deg)';

  var predkosc = Math.floor(value * 1.8)
  if (predkosc == 81 || predkosc == 131) {
    predkosc = predkosc - 1
  }

  html.text(predkosc);
}