import 'package:flutter/material.dart';

// ============================================================
// AUTH SCREENS
// ============================================================
import '../screens/splash_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/login_screen.dart';
import '../screens/forgot_password_screen.dart';

// ============================================================
// REGISTER SCREENS
// ============================================================
import '../screens/register_personal_screen.dart';
import '../screens/register_contact_screen.dart';
import '../screens/register_address_screen.dart';
import '../screens/register_id_screen.dart';
import '../screens/register_account_screen.dart';
import '../screens/registration_pending_screen.dart';

// ============================================================
// MAIN APP SCREENS
// ============================================================
import '../screens/home_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/search_screen.dart';
import '../screens/search_results_screen.dart';
import '../screens/products_detail_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/voucher_selection_screen.dart';
import '../screens/payment_method_screen.dart';
import '../screens/order_success_screen.dart';

// ============================================================
// ORDERS SCREENS
// ============================================================
import '../screens/my_orders_screen.dart';
import '../screens/order_details_screen.dart';
import '../screens/order_tracking_screen.dart';
import '../screens/rate_feedback_screen.dart';

// ============================================================
// CHAT SCREENS
// ============================================================
import '../screens/chat_list_screen.dart';
import '../screens/chat_conversation_screen.dart';

// ============================================================
// ACCOUNT SCREENS
// ============================================================
import '../screens/account_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/address_book_screen.dart';
import '../screens/add_address_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/logout_confirmation_screen.dart';

// ============================================================
// APP ROUTER
// ============================================================
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ============================================================
      // AUTH SCREENS
      // ============================================================
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case '/welcome':
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case '/forgot_password':
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      // ============================================================
      // REGISTER SCREENS
      // ============================================================
      case '/register_personal':
        return MaterialPageRoute(
          builder: (_) => const RegisterPersonalScreen(),
        );

      case '/register_contact':
        return MaterialPageRoute(
          builder: (_) => const RegisterContactScreen(),
        );

      case '/register_address':
        return MaterialPageRoute(
          builder: (_) => const RegisterAddressScreen(),
        );

      case '/register_id':
        return MaterialPageRoute(
          builder: (_) => const RegisterIDScreen(),
        );

      case '/register_account':
        return MaterialPageRoute(
          builder: (_) => const RegisterAccountScreen(),
        );

      case '/registration_pending':
        return MaterialPageRoute(
          builder: (_) => const RegistrationPendingScreen(),
        );

      // ============================================================
      // MAIN APP SCREENS
      // ============================================================
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case '/categories':
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );

      case '/search':
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );

      case '/search_results':
        final query = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => SearchResultsScreen(
            searchQuery: query,
          ),
        );

      // ============================================================
      // PRODUCT DETAILS
      // ============================================================
      case '/product_detail':
        final productId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            productId: productId,
          ),
        );

      case '/cart':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

      case '/checkout':
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );

      case '/voucher_selection':
        return MaterialPageRoute(
          builder: (_) => const VoucherSelectionScreen(),
        );

      case '/payment_method':
        return MaterialPageRoute(
          builder: (_) => const PaymentMethodScreen(),
        );

      case '/order_success':
        return MaterialPageRoute(
          builder: (_) => const OrderSuccessScreen(),
        );

      // ============================================================
      // ORDERS SCREENS
      // ============================================================
      case '/my_orders':
        return MaterialPageRoute(
          builder: (_) => const MyOrdersScreen(),
        );

      case '/order_details':
        final orderId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(
            orderId: orderId,
          ),
        );

      case '/order_tracking':
        final orderId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => OrderTrackingScreen(
            orderId: orderId,
          ),
        );

      case '/rate_feedback':
        final orderId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => RateFeedbackScreen(
            orderId: orderId,
          ),
        );

      // ============================================================
      // CHAT SCREENS
      // ============================================================
      case '/chat_list':
        return MaterialPageRoute(
          builder: (_) => ChatListScreen(),
        );

      case '/chat_conversation':
        final chatId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => ChatConversationScreen(
            chatId: chatId,
          ),
        );

      // ============================================================
      // ACCOUNT SCREENS
      // ============================================================
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const AccountScreen(),
        );

      case '/edit_profile':
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );

      case '/address_book':
        return MaterialPageRoute(
          builder: (_) => AddressBookScreen(),
        );

      case '/add_address':
        return MaterialPageRoute(
          builder: (_) => const AddAddressScreen(),
        );

      case '/notification':
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );

      case '/logout_confirmation':
        return MaterialPageRoute(
          builder: (_) => const LogoutConfirmationScreen(),
        );

      // ============================================================
      // FALLBACK
      // ============================================================
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
