
abstract class JobCardEvent {}

class saveJobCard extends JobCardEvent {
  final String claim; 
  final String chassis;
  final String note;

  saveJobCard(this.claim, this.chassis, this.note);
}
