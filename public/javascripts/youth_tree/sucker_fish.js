/* DO NOT MODIFY. This file was compiled Sun, 02 Jan 2011 10:46:46 GMT from
 * /Users/sutto/Code/YouthTree/yt-redesign/coffeescripts/youth_tree/sucker_fish.coffee
 */

YouthTree.withNS('SuckerFish', function(ns) {
  ns.navigationSelector = "#page-header nav ul li";
  return ns.setup = function() {
    return $(ns.navigationSelector).hover((function() {
      return $(this).addClass('sfhover');
    }), (function() {
      return $(this).removeClass('sfhover');
    }));
  };
});