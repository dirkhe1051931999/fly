/// 邀请朋友页
import 'package:flutter/material.dart';
import 'package:fly/shell/values/app_theme.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/inviteImage.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: const Text(
                  '拉上好友一起玩',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  '好东西要分享',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print('分享');
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    '分享',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
