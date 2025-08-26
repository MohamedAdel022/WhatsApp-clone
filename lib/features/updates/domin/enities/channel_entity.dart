sealed class ChannelEntity {
  final String id;
  final String name;
  final String? avatarUrl;

  ChannelEntity({
    required this.id,
    required this.name,
     this.avatarUrl,
  });
}

class SubscribedChannelEntity extends ChannelEntity {
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;

  SubscribedChannelEntity({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
  });
}

class SuggestedChannelEntity extends ChannelEntity {
  final int followersCount;
 

  SuggestedChannelEntity({
    required super.id,
    required super.name,
    required super.avatarUrl,
    required this.followersCount,
   
  });
}
