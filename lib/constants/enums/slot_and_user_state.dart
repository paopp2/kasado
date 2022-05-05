enum SlotAndUserState {
  loading,
  error,
  slotEnded,
  slotClosedByAdmin,
  slotFull,
  slotHasUser,
  userAvailable,
  userHasConflictWithOtherSlot,
}

extension SlotAndUserStatePatternMatching on SlotAndUserState {
  // ignore: long-parameter-list, pattern matching for SlotAndUserState
  T when<T>({
    T Function()? loading,
    T Function()? error,
    T Function()? slotEnded,
    T Function()? slotClosedByAdmin,
    T Function()? slotFull,
    T Function()? slotHasUser,
    T Function()? userAvailable,
    T Function()? userHasConflictWithOtherSlot,
    T Function()? orElse,
  }) {
    switch (this) {
      case SlotAndUserState.loading:
        return loading?.call() ?? orElse!();
      case SlotAndUserState.error:
        return error?.call() ?? orElse!();
      case SlotAndUserState.slotEnded:
        return slotEnded?.call() ?? orElse!();
      case SlotAndUserState.slotClosedByAdmin:
        return slotClosedByAdmin?.call() ?? orElse!();
      case SlotAndUserState.slotFull:
        return slotFull?.call() ?? orElse!();
      case SlotAndUserState.slotHasUser:
        return slotHasUser?.call() ?? orElse!();
      case SlotAndUserState.userHasConflictWithOtherSlot:
        return userHasConflictWithOtherSlot?.call() ?? orElse!();
      case SlotAndUserState.userAvailable:
        return userAvailable?.call() ?? orElse!();
    }
  }
}
