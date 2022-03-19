enum SlotAndUserState {
  loading,
  error,
  slotEnded,
  slotClosedByAdmin,
  slotFull,
  userNotReserved,
  userReservedAtThisSlot,
  userReservedAtAnotherSlot,
}

extension SlotAndUserStatePatternMatching on SlotAndUserState {
  T when<T>({
    T Function()? loading,
    T Function()? error,
    T Function()? slotEnded,
    T Function()? slotClosedByAdmin,
    T Function()? slotFull,
    T Function()? userNotReserved,
    T Function()? userReservedAtThisSlot,
    T Function()? userReservedAtAnotherSlot,
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
      case SlotAndUserState.userNotReserved:
        return userNotReserved?.call() ?? orElse!();
      case SlotAndUserState.userReservedAtThisSlot:
        return userReservedAtThisSlot?.call() ?? orElse!();
      case SlotAndUserState.userReservedAtAnotherSlot:
        return userReservedAtAnotherSlot?.call() ?? orElse!();
    }
  }
}
