class GetHeaders {
  final String token;

  const GetHeaders({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    'x-api-key': token,
  };
}