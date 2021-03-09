import $, { map } from "jquery";
import "select2";
import { initMapbox } from "../plugins/init_mapbox";

const initSelect2 = () => {
  const filter = $("#select-item-type-id");
  filter.select2();
  return filter;
};

const clearFilter = () => {
  document.querySelectorAll(".space-partial").forEach((space) => {
    space.classList.remove("d-none");
  });
};

const updateMapMarkers = () => {
  const displayedSpaces = document.querySelectorAll(".currently-displayed");
  const filteredMarkers = [];
  displayedSpaces.forEach((space) => {
    const parsedCoords = JSON.parse(space.dataset.coordinates);
    filteredMarkers.push(parsedCoords);
  });
  const mapElement = document.getElementById("map");
  mapElement.dataset.markers = JSON.stringify(filteredMarkers);
  initMapbox();
};

const filterSpaces = (id) => {
  if (!id) {
    return clearFilter();
  }
  id = parseInt(id, 10);
  document.querySelectorAll(".space-partial").forEach((space) => {
    const itemTypeIds = JSON.parse(space.dataset.itemTypeIds);
    if (itemTypeIds.includes(id)) {
      //mapElement.addLayer(marker);
      space.classList.remove("d-none");
      space.classList.add("currently-displayed");
    } else {
      //mapElement.removeLayer(marker);
      space.classList.add("d-none");
      space.classList.remove("currently-displayed");
    }
  });
  updateMapMarkers();
};

const initSpacesFilter = () => {
  const filter = initSelect2();

  filter.on("select2:select", (e) => {
    const id = e.currentTarget.value;
    filterSpaces(id);
  });
};

export { initSpacesFilter };
