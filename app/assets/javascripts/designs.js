(function() {
  $(function() {
    return $('#designs').imagesLoaded(function() {
      return $('#designs').masonry({
        itemSelector: '.box',
        isFitWidth: true
      });
    });
  });

}).call(this);
