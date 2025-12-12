import { notFound } from 'next/navigation';

const GRAPHQL_ENDPOINT =  "http://backend:3000/graphql";

const mahjongSessionQuery = `
  query GetMahjongSession($id: ID!) {
    mahjongSession(id: $id) {
      id
      title
      members {
        id
        name
      }
    }
  }
`;

interface Member {
  id: string;
  name: string;
}

interface MahjongSession {
  id: string;
  title: string;
  members: Member[];
}

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

async function fetchSessionData(sessionId: string): Promise<MahjongSession | null> {
  const response = await fetch(GRAPHQL_ENDPOINT, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      query: mahjongSessionQuery,
      variables: { id: '1' },
    }),
  });

  if (!response.ok) {
    console.error(`Failed to fetch session data: ${response.status}`);
    return null;
  }

  const result = await response.json();
  if (result.errors || !result.data?.mahjongSession) {
    console.error("GraphQL Error:", result.errors);
    return null;
  }

  return result.data.mahjongSession;
}

export default async function SessionEditPage({ params }: PageProps) {
  const { id:sessionId } = await params;
  const session = await fetchSessionData(sessionId);

  if (!session) {
    // データが見つからなかった場合は404ページを表示
    return notFound();
  }

  return (
    <div className="container mx-auto p-8">
      <h1 className="text-3xl font-bold mb-6">
        {session.title}
      </h1>

      <section className="bg-white p-6 rounded-lg shadow">
        <h2 className="text-xl font-semibold mb-4">基本情報の変更</h2>

        <form className="space-y-4">
          <div>
            <label htmlFor="title" className="block text-sm font-medium text-gray-700">
              タイトル
            </label>
            <input
              type="text"
              id="title"
              defaultValue={session.title}
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm p-2"
            />
          </div>

          <div>
            <label htmlFor="date" className="block text-sm font-medium text-gray-700">
              開催日
            </label>
            <input
              type="date"
              id="date"
              className="mt-1 block w-full rounded-md border-gray-300 shadow-sm p-2"
            />
          </div>

          <button
            type="submit"
            className="px-4 py-2 bg-blue-600 text-white font-medium rounded-md hover:bg-blue-700 transition-colors"
          >
            変更を保存
          </button>
        </form>
      </section>

      <section className="mt-8 bg-white p-6 rounded-lg shadow">
         <h2 className="text-xl font-semibold mb-4">参加メンバー</h2>
         <ul>
           {session.members.map(member => (
             <li key={member.id}>{member.name}</li>
           ))}
         </ul>
         {/* メンバーの追加・削除機能のコンポーネントをここに配置 */}
      </section>

    </div>
  );
}
