import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/features/chats/domin/entities/chat_entity.dart';
import 'package:whats_app_clone/features/updates/domin/enities/channel_entity.dart';

class DummyData {
  /// Returns a list of dummy subscribed channel entities.
  static List<SubscribedChannelEntity> getSubscribedChannels() {
    return [
      SubscribedChannelEntity(
        id: '1',
        name: 'Al-Ahly Channel',
        avatarUrl: Assets.channalTemp,
        lastMessage: 'Hello from Al-Ahly Channel',
        lastMessageTime: DateTime.now(),
        unreadCount: 2,
      ),
      SubscribedChannelEntity(
        id: '2',
        name: 'Al-Ahly Channel1',
        avatarUrl: Assets.channalTemp,
        lastMessage: 'Hello from Al-Ahly Channel',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 2)),
        unreadCount: 5,
      ),
      SubscribedChannelEntity(
        id: '3',
        name: 'Al-Ahly Channel2',
        avatarUrl: Assets.channalTemp,
        lastMessage: 'Hello from Al-Ahly Channel2',
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
        unreadCount: 0,
      ),
      SubscribedChannelEntity(
        id: '4',
        name: 'Al-Ahly Channel3',
        avatarUrl: Assets.channalTemp,
        lastMessage: 'Hello from Al-Ahly Channel3',
        lastMessageTime: DateTime.now().subtract(Duration(days: 3)),
        unreadCount: 1,
      ),
    ];
  }

  /// Returns a list of dummy suggested channel entities.
  static List<SuggestedChannelEntity> getSuggestedChannels() {
    return [
      SuggestedChannelEntity(
        id: '1',
        name: 'Suggested Channel 1',
        avatarUrl: Assets.channalTemp,
        followersCount: 1500,
      ),
      SuggestedChannelEntity(
        id: '2',
        name: 'Suggested Channel 2',
        avatarUrl: Assets.channalTemp,
        followersCount: 2500,
      ),
      SuggestedChannelEntity(
        id: '3',
        name: 'Suggested Channel 3',
        avatarUrl: Assets.channalTemp,
        followersCount: 3500,
      ),
    ];
  }

  static List<ChatEntity> getChatEntities() {
    return [
      ChatEntity(
        id: '1',
        name: 'John Doe',
        avatarUrl: Assets.temp,
        lastMessage: 'Hey, how are you?',
        lastMessageTime: DateTime.now(),
        unreadCount: 2,
      ),
      ChatEntity(
        id: '2',
        name: 'Jane Smith',
        avatarUrl: Assets.temp,
        lastMessage: 'See you at the meeting!',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
        unreadCount: 5,
      ),
      ChatEntity(
        id: '3',
        name: 'Mike Johnson',
        avatarUrl: Assets.temp,
        lastMessage: 'Don\'t forget the report!',
        lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
        unreadCount: 0,
      ),
      ChatEntity(
        id: '4',
        name: 'Emily Davis',
        avatarUrl: Assets.temp,
        lastMessage: 'Let\'s catch up later.',
        lastMessageTime: DateTime.now().subtract(Duration(days: 3)),
        unreadCount: 1,
      ),
    ];
  }
}
