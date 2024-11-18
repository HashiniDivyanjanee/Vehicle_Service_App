abstract class JobCardEvent{}

class saveJobCard extends JobCardEvent{
  final String claim; 
  final String chassis;
  final String note;

  saveJobCard({required this.claim, required this.chassis, required this.note});
}