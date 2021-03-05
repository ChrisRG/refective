import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    enableTime: true,
    time_24hr: true,
  });
};

export { initFlatpickr };
