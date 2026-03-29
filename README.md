# Zest Medical 🏥

**Zest Medical** is a high-performance mobile healthcare application built with Flutter. It streamlines the connection between patients and healthcare providers by offering an intuitive interface for discovering medical specialists, managing appointments, and tracking health service ratings.

---

## 🚀 Key Features

* **Advanced Specialist Search:** Real-time filtering logic to browse doctors by unique specializations and expertise categories.
* **Integrated Rating System:** A robust feedback module allowing users to rate medical services with seamless local data persistence.
* **Payment Management:** A dedicated UI for managing and dismissing cached payment methods for a faster checkout experience.
* **Resilient Networking:** Advanced API integration with custom error handling to manage connectivity issues and ensure data integrity.

## 🛠 Tech Stack

* **Framework:** [Flutter](https://flutter.dev) (Dart)
* **State Management:** [Bloc / Cubit](https://pub.dev/packages/flutter_bloc) - Used for predictable state transitions and separation of business logic.
* **Local Storage:** [Hive](https://pub.dev/packages/hive) - A lightweight NoSQL database for caching and local data models.
* **API Client:** [Dio](https://pub.dev/packages/dio) - For REST API communication, featuring custom interceptors for robust error handling.
* **Code Generation:** `build_runner` with `hive_generator` for automated TypeAdapter creation.

## 📂 Project Structure

# lib/
# ├── core/            
* App constants, shared utilities, and networking helpers.
# ├── data/            
* Data models (Hive-ready), repositories, and providers.
# ├── logic/
* Business logic layer (Bloc/Cubit implementations).
# ├── presentation/    
* UI components, custom widgets, and feature screens.
# └── main.dart       
* Application entry point.

# Installation & Setup
# Follow these steps to get the project running locally:
# 1-Clone the repository:
* git clone [https://github.com/khaledmahmoudhamed/zest_medical](https://github.com/khaledmahmoudhamed/zest_medical)
# 2-Install dependencies:
* flutter pub get
# 3-Generate local database adapters:
* dart run build_runner build --delete-conflicting-outputs
# 4-Run the application:
* flutter run

# Challenges & Engineering Solutions

State Persistence: Implemented custom TypeAdapters for the RatingModel in Hive to ensure user reviews are saved locally and retrieved instantly.
Network Stability: Developed a centralized error-handling strategy for DioException to prevent app crashes during "Connection closed" or "Null-safety" API exceptions.
UI Optimization: Leveraged ListView.builder combined with logic-driven filtering to maintain a smooth 60fps scrolling experience even with large datasets.

![30](https://github.com/user-attachments/assets/184bb90a-dadc-4528-86fc-7e13d9f5f07b)
![29](https://github.com/user-attachments/assets/d1d0eb7d-50ce-441e-b751-3ce11dfb721f)
![28](https://github.com/user-attachments/assets/5c0400ef-bf77-414b-b2b5-789daadac863)
![27](https://github.com/user-attachments/assets/5a86c051-6c6f-46bc-b60f-79682ce98b2d)
![26](https://github.com/user-attachments/assets/51005f07-74d5-4ba4-8551-4348302410ca)
![25](https://github.com/user-attachments/assets/773465d3-1e1f-413e-b752-ffd01127fbf2)
![24](https://github.com/user-attachments/assets/f9c8025b-c0de-4d80-9786-ec9768b0a232)
![23](https://github.com/user-attachments/assets/e2d82211-5334-46b2-9978-b6c07e2a92c4)
![22](https://github.com/user-attachments/assets/66926c0d-fde1-418e-bec5-64fea303511b)
![21](https://github.com/user-attachments/assets/a73a644d-5fb9-4d0c-96c4-746e3968ded2)
![20](https://github.com/user-attachments/assets/57193f91-9ae6-4747-8fa5-1e88647a182c)
![19](https://github.com/user-attachments/assets/b14a7f38-55e6-4518-b74d-8615eea1f285)
![18](https://github.com/user-attachments/assets/37601c68-25c9-4218-8e4e-b45b5925dc21)
![17](https://github.com/user-attachments/assets/b2ff7e83-7cc9-41ba-ad67-e2b0eadd4ee9)
![16](https://github.com/user-attachments/assets/9a8ac3a7-5c1b-4082-a8d5-24b5dae7b8bc)
![15](https://github.com/user-attachments/assets/7a9b6d90-e0f0-494b-ac31-f8ecde871e92)
![14](https://github.com/user-attachments/assets/7fb9c119-7e58-4236-b065-1de7f51bab91)
![13](https://github.com/user-attachments/assets/e7de3e8f-fe41-4e89-bf91-c5c519778781)
![12](https://github.com/user-attachments/assets/6c57d1ad-64f8-4da5-8b4d-02d54b78ca1d)
![11](https://github.com/user-attachments/assets/bec7d2b3-38dc-4102-9baf-e935db04bfee)
![10](https://github.com/user-attachments/assets/ab1d93ed-e990-4ca8-bd1b-3f45b4833961)
![9](https://github.com/user-attachments/assets/1a44feb2-dfb4-46bf-8eb3-688df5a6e9d5)
![8](https://github.com/user-attachments/assets/6997d7b1-191f-43b7-9c19-0d283058275d)
![7](https://github.com/user-attachments/assets/afed77ad-4dff-4587-9a80-f96a9b9ad7e9)
![6](https://github.com/user-attachments/assets/1fc738b6-803a-4ae4-9ec1-2d65ea4df5f6)
![5](https://github.com/user-attachments/assets/02e1db46-7f29-4486-a7da-784b3521d909)
![4](https://github.com/user-attachments/assets/5ebd22ed-19b2-4583-9ac8-77a8a6ff2671)
![3](https://github.com/user-attachments/assets/daf7b171-7ac7-44ad-aac7-ad04fc4b7d57)
![1](https://github.com/user-attachments/assets/a2d4ed74-c4fc-424c-ae1b-8e669b1f2698)


<p align="center">
  <img src="https://github.com/user-attachments/assets/69357b6d-4080-45b3-83e5-e9ee1ff086d5" width="30%" />
  <img src="https://github.com/user-attachments/assets/15e04986-08f8-4373-b8a4-7a1ee88c0053" width="30%" />
   <img src="https://github.com/user-attachments/assets/830fa970-b631-47ba-be42-b4b42ea7baf9" width="30%" />
   <img src="https://github.com/user-attachments/assets/7f3ef331-a3e9-41d3-a205-8ea6f6ab6b83" width="30%" />
   <img src="https://github.com/user-attachments/assets/7f80e18a-b0a1-4705-aca7-5727b30f9656" width="30%" />
   <img src="https://github.com/user-attachments/assets/c577de00-527a-4012-bd56-59fc603b15ce" width="30%" />
   <img src="https://github.com/user-attachments/assets/4caf23e8-e092-42d7-a1cd-d18b2600a432" width="30%" />
    <img src="https://github.com/user-attachments/assets/7196d4aa-c295-46b0-ada5-8c6253ceee94" width="30%" />
    <img src="https://github.com/user-attachments/assets/9d18fba5-2da8-45d8-b7d6-e9c5c617a6ba" width="30%" />
    <img src="https://github.com/user-attachments/assets/475d0bc3-fb73-47e7-bb4b-40dd4581569f" width="30%" />
    <img src="https://github.com/user-attachments/assets/61fdf7b5-b654-4792-9770-ca42eaff264f" width="30%" />
    <img src="https://github.com/user-attachments/assets/0a36c26f-5890-4959-b06e-f941a769beab" width="30%" />
    <img src="https://github.com/user-attachments/assets/7ed6a515-f48d-4e0a-94a1-7ea035d32f0a" width="30%" />
  <img src="https://github.com/user-attachments/assets/0c4044ca-0d11-4ed2-82eb-6dc38f99030d" width="30%" />
  <img src="https://github.com/user-attachments/assets/1f4b4269-6f63-4f29-8891-70ed68c55c82" width="30%" />
  <img src="https://github.com/user-attachments/assets/e3bd38a1-a5b6-468b-8978-cfbafa64663b" width="30%" />
  <img src="https://github.com/user-attachments/assets/2cbe67bc-38d5-471b-af4b-9ae0233dde0b" width="30%" />
  <img src="https://github.com/user-attachments/assets/8b62b86d-6e46-4748-92a8-56ce59d09878" width="30%" />
  <img src="https://github.com/user-attachments/assets/ca13855e-a7e6-4107-950f-f8591fb7670f" width="30%" />
  <img src="https://github.com/user-attachments/assets/e4c49e87-66ff-4509-9282-c436c98ccc4e" width="30%" />
  <img src="https://github.com/user-attachments/assets/f16e9a77-7c16-40a6-af4e-7ef573b19c81" width="30%" />
  <img src="https://github.com/user-attachments/assets/84f1ff53-fe50-435e-80b3-a7326569bc67" width="30%" />
  <img src="https://github.com/user-attachments/assets/18f6b0ee-36b8-474b-a5e3-6f6c615153ba" width="30%" />
   <img src="https://github.com/user-attachments/assets/794e64a2-e469-4625-9750-2423e553547c" width="30%" />
    <img src="https://github.com/user-attachments/assets/60e1d08a-0c52-429f-9b25-a4466495531b" width="30%" />
     <img src="https://github.com/user-attachments/assets/a8394472-e698-4c49-bbea-4a3f86bd3fbf" width="30%" />
      <img src="https://github.com/user-attachments/assets/4bb852fb-ddcf-42cf-a1c6-95753517364a" width="30%" />
       <img src="https://github.com/user-attachments/assets/499630d3-bf6a-4dcc-b0d2-9e73fab159de" width="30%" />
        <img src="https://github.com/user-attachments/assets/b87e8960-a806-42cf-a760-f0687c3d8ebd" width="30%" />
         <img src="https://github.com/user-attachments/assets/11dece34-afdc-43b0-be50-b4721833db76" width="30%" />
          <img src="https://github.com/user-attachments/assets/2a93d644-057c-4e44-b043-cae4ab746387" width="30%" />
           <img src="https://github.com/user-attachments/assets/0d48ca78-82c6-4da4-b356-2df11a6babe7" width="30%" />
            <img src="https://github.com/user-attachments/assets/306fe5bb-dd35-4f86-bc06-f81fd52126cc" width="30%" />
            <img src="https://github.com/user-attachments/assets/306fe5bb-dd35-4f86-bc06-f81fd52126cc" width="30%" />
                <img src="https://github.com/user-attachments/assets/932afb20-5b23-47a3-adfe-f0a873f4da34" width="30%" />
                  <img src="https://github.com/user-attachments/assets/a7c63c44-812b-4232-bf4c-d8bc22530e53" width="30%" />
<img src="https://github.com/user-attachments/assets/306fe5bb-dd35-4f86-bc06-f81fd52126cc" width="30%" />
                    <img src="hhttps://github.com/user-attachments/assets/d4f8830d-16ba-49f0-9716-4147b0ba197d" width="30%" />
                      <img src="https://github.com/user-attachments/assets/bc79e0aa-adaa-4105-87e7-9a31e9821f86" width="30%" />
                        <img src="https://github.com/user-attachments/assets/f24dce19-efa5-4a9b-a25f-46dcfdff4114" width="30%" />
                         <img src="https://github.com/user-attachments/assets/e48fa907-77ba-49ab-a3d7-cca934851f6c" width="30%" />
                              <img src="https://github.com/user-attachments/assets/45b58d7f-7d5e-4c12-95c0-9c26f6e0c4c7" width="30%" />
                                  <img src="https://github.com/user-attachments/assets/0612b931-ffbe-491d-8bea-c10ccc41b840" width="30%" />
         <img src="https://github.com/user-attachments/assets/609b5d68-edce-479a-8485-f93d542ac283" width="30%" />
           <img src="https://github.com/user-attachments/assets/22ce0aca-336f-40ca-aa64-697c88ae606f" width="30%" />
             <img src="https://github.com/user-attachments/assets/c43bd09b-52b9-481f-a4ef-b542bdd90747" width="30%" />
               <img src="https://github.com/user-attachments/assets/53be7365-afc7-412c-b1d6-cb54eae71780" width="30%" />
                 <img src="https://github.com/user-attachments/assets/57baacdd-d597-40ed-974f-e763de8d8ce5" width="30%" />
                   <img src="https://github.com/user-attachments/assets/96397622-60f0-4e8e-9628-f4af8f183d3a" width="30%" />
                     <img src="https://github.com/user-attachments/assets/8d8eb174-92cb-4091-9dd2-5c04e8e64612" width="30%" />
                     <img src="https://github.com/user-attachments/assets/4c8a0ccf-39a7-4225-a3be-0b31487ddf04" width="30%" />
                     <img src="https://github.com/user-attachments/assets/e8c86ee2-6ec8-40c1-8da6-eda7382bea2a" width="30%" />
                     <img src="https://github.com/user-attachments/assets/5ba6f53f-f0d4-4db2-929a-601302bcbfee" width="30%" />
                     <img src="https://github.com/user-attachments/assets/a1bc8136-8ae3-4b4d-8c66-d6311729b2f6" width="30%" />
                     <img src="https://github.com/user-attachments/assets/68dafa0d-bbfc-42d0-8679-110e01d1a162" width="30%" />
                     <img src="https://github.com/user-attachments/assets/a052293e-8213-4b87-bde0-206a2f96a473" width="30%" />
                      <img src="https://github.com/user-attachments/assets/e80c0141-7bd1-4aa3-b066-33082032e79d" width="30%" />
                       <img src="https://github.com/user-attachments/assets/e7c69722-988e-4d93-bd44-a97b8e2f925a" width="30%" />
                        <img src="https://github.com/user-attachments/assets/5b23c91d-f7b2-47b0-8f17-5425ae91bec5" width="30%" />
                         <img src="https://github.com/user-attachments/assets/7db25929-2f1f-4d7a-b469-d7cddc81d663" width="30%" />
                          <img src="https://github.com/user-attachments/assets/2badfebf-fe07-4a17-b143-e6219c425f16" width="30%" />
                           <img src="https://github.com/user-attachments/assets/deda1b7a-a54f-4505-a724-4fc4498d1e9d" width="30%" />

              




            
  
</p>




