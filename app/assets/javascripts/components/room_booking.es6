export default class RoomBooking {
  constructor(el) {
    this.$el = $(el);
    this.init();
  }

  init(){
    this.reserveRoom();
    this.cancelRoomBooking();
  }

  reserveRoom(){
    this.$el.find('[data-reserve-room]').click(() => {
      let linkDataset = event.target.dataset
      $.ajax({
          method: "POST",
          url: "/room_bookings",
          data: { "date": linkDataset.date, "room": linkDataset.roomId , "hour": linkDataset.hour  }
      });
      this.updateRoomBooking(event.target);
      return false;
    });
  }

  updateRoomBooking(target){
    let parentTarget = $(target).parent();
    let reserveElement = "<p>Reservado para " +
                                     target.dataset.user +
                                     "</p>"
    $(target).remove();
    parentTarget.append(reserveElement);
  }

  cancelRoomBooking(){
    this.$el.find('[data-cancel-room-booking]').click(() => {
      let linkDataset = event.target.dataset
      $.ajax({
          method: "DELETE",
          url: "/room_bookings/" + linkDataset.roomBooking
      });
      this.availableRoom(event.target);
      return false;
    });
  }

  availableRoom(target){
    let parentTarget = $(target).parent().parent();
    let linkDataset = target.dataset;
    let reserveElement = "<a href='#' data-room-id='"
                                    + linkDataset.roomId +
                                    "' data-date='"
                                    + linkDataset.date +
                                    "' data-hour='"
                                    + linkDataset.hour +
                                    "' data-room-booking=0>Disponível </a>"
    $(target).parent().remove();
    parentTarget.append(reserveElement);
    return false;
  }
}
