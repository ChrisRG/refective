import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    enableTime: true,
  });
};

export { initFlatpickr };
