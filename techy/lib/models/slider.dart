class SliderView {
  final String name;
  final String imageUrl;

  const SliderView({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<SliderView> sliderview = [
    SliderView(
        name: "",
        imageUrl:
            "https://www.cnet.com/a/img/resize/36fdb40cf1bf381511cec2cb99affaeaa903c64a/hub/2022/04/26/0a286fff-7903-48be-b0cb-fa7e29826c53/samsung-galaxy-book-2-pro-360-01.jpg?auto=webp&fit=crop&height=362&width=644"),
    SliderView(
        name: "",
        imageUrl:
            "https://images.unsplash.com/photo-1611078489935-0cb964de46d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"),
    SliderView(
        name: "",
        imageUrl:
            "https://images.unsplash.com/photo-1580522154071-c6ca47a859ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
  ];
}
