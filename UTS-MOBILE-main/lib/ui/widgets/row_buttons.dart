part of 'widgets.dart';

class RowButtons extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressedContinue;
  final VoidCallback onPressedBack;

  const RowButtons({
    super.key,
    required this.width,
    required this.height,
    required this.onPressedContinue,
    required this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height / 8,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 7.5),
              width: width / 2 - 40,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    side: const BorderSide(width: 1, color: Colors.deepPurple),
                  ),
                  onPressed: () => onPressedBack(),
                  child: const Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 7.5),
              width: width / 2 - 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => onPressedContinue(),
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
