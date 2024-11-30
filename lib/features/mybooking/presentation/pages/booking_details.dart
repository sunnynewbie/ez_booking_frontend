import 'package:ez_booking/core/config/app_assets.dart';
import 'package:ez_booking/core/config/app_color.dart';
import 'package:ez_booking/core/config/app_dimensions.dart';
import 'package:ez_booking/core/config/app_font.dart';
import 'package:ez_booking/core/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style: TextStyle(
              color: Colors.black,
              fontFamily: AppFont.lexend,
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimens.space15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.3), width: 1.1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            AppAssets.music_review,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                              'Thu, Sep 21-Fri, Sep 22',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontFamily: AppFont.lexend),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              'Group Trekking',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: AppFont.lexend,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              'Manali UK (India)',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontFamily: AppFont.lexend),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                _buildSection(
                  title: 'Booking Details',
                  content: [
                    _buildRow('Duration', '7 Days (19 Sep-25 Sep)'),
                    _buildRow('Location', 'Manali (UK), India'),
                    _buildRow('Time', '07:00 AM - 08:00 PM'),
                  ],
                ),
                SizedBox(height: 15),
                _buildSection(
                  title: 'Price Details',
                  content: [
                    _buildRow('Subtotal', '₹600.00'),
                    _buildRow('Tax', '₹100.00'),
                    _buildRow('Grand Total', '₹700.00'),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(AppDimens.space15),
            child: AppElevatedButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCancelDialogue(context);
                  },
                );
              },
              borderRadius: 15,
              height: AppDimens.space40,
              width: double.infinity,
              buttonName: 'Cancel Booking',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: AppFont.lexend,
              fontWeight: FontWeight.w700,
              fontSize: 15),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.1),
          ),
          child: Column(children: content),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: AppColors.grey78.withOpacity(0.7),
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.black,
                fontFamily: AppFont.lexend,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

Widget _buildCancelDialogue(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Reduced circular radius
        ),
      ),
    ),
    child: AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              height: 40,
              width: 40,
              child: Image.asset(AppAssets.bookingIcon, scale: 4,),
            ),
            Text(
              'Do you want to cancel booking?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Go back to login and use that password to use login again',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 20),
            AppElevatedButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              width: double.infinity, 
              height: 42,
              borderRadius: 15,
              buttonName: 'Yes',
            ),
            SizedBox(height: 15),
            AppElevatedButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              width: double.infinity,
              height: 42,
              borderRadius: 15,
              buttonName: 'No',
              borderColor: Colors.grey.withOpacity(0.4),
              buttonColor: Colors.white,
              fontColor: Colors.grey,
            ),
          ],
        ),
      ),
    ),
  );
}


}
