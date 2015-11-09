$(document).ready(function () {
  $('#car_type').change(function () {
    var carBottomSeats = $('#car_bottom_seats').parents('.form-group');
    var carTopSeats = $('#car_top_seats').parents('.form-group');
    var carSideBottomSeats = $('#car_side_bottom_seats').parents('.form-group');
    var carSideTopSeats = $('#car_side_top_seats').parents('.form-group');

    switch ($(this).val()) {
      case 'EconomyCar':
        carBottomSeats.show();
        carTopSeats.show();
        carSideBottomSeats.show();
        carSideTopSeats.show();
        break;
      case 'CoupeCar':
        carBottomSeats.show();
        carTopSeats.show();
        carSideBottomSeats.hide();
        carSideTopSeats.hide();
        break;
      case 'PremiumCar':
      case 'SittingCar':
        carBottomSeats.show();
        carTopSeats.hide();
        carSideBottomSeats.hide();
        carSideTopSeats.hide();
    }
  });
});
