import $ from "jquery";
import "select2";

const clearSelect2 = () => {
  $("span.select2").remove();
  $(".select2").each(function (index, element) {
    console.log(element);
    if (element.classList.contains("select2-hidden-accessible")) {
      // Select2 has been initialized
      $(element).select2("destroy");
    }
  });
};

const initSelect2 = () => {
  clearSelect2(); //comment if map is glitching
  //$(".select2").select2("destroy");
  $(".select2").select2();
};

export { initSelect2 };
