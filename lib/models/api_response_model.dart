class ApiResponse<T> {
  final T data;
  final int responseCode;

  ApiResponse(this.data, this.responseCode);
}
