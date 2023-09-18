class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  /// init the api services for the current provider
  ///
  /// construcutor uses list initializer to assign the [status] to initial
  ApiResponse.initial(this.message) : status = Status.initial;

  /// set the api services status for loading
  ///
  /// construcutor uses list initializer to assign the [status] to loading
  ApiResponse.loading(this.message) : status = Status.loading;

  /// set the api services status for completed and should be provided
  /// with the data fetched from api
  ///
  /// construcutor uses list initializer to assign the [status] to completed
  ApiResponse.completed(this.data) : status = Status.completed;

  /// set the api services status for error if there is one
  ///
  /// construcutor uses list initializer to assign the [status] to error
  ApiResponse.error(this.message) : status = Status.erorr;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { initial, loading, completed, erorr }
