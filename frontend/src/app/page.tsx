import  Link from "next/link";

const topPageQuery = `
  query GetTopPageData {
    topPage {
      members {
        id
        name
      }
      mahjongSessions {
        id
        title
      }
    }
  }
`;

const GRAPHQL_ENDPOINT = "http://backend:3000/graphql";
interface Member {
  id: string;
  name: string;
}

interface MahjongSession {
  id: string;
  title: string;
}

interface TopPageData {
  topPage: {
    members: Member[];
    mahjongSessions: MahjongSession[];
  };
}

async function getTopPageData(): Promise<TopPageData | null> {
  try {
    const response = await fetch(GRAPHQL_ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        query: topPageQuery,
      }),
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const result: { data: TopPageData } = await response.json();
    return result.data;

  } catch (error) {
    console.error("Failed to fetch top page data:", error);
    return null;
  }
}

export default async function Home() {
  const data = await getTopPageData();

  const members = data?.topPage.members || [];
  const sessions = data?.topPage.mahjongSessions || [];

  return (
    <div className="flex min-h-screen items-center justify-center bg-zinc-50 font-sans dark:bg-black">
      <main className="flex min-h-screen w-full max-w-3xl flex-col items-center justify-between py-32 px-16 bg-white dark:bg-black sm:items-start">
        <div className="flex flex-col items-center gap-6 text-center sm:items-start sm:text-left mt-8">
          <h1 className="max-w-xs text-3xl font-semibold leading-10 tracking-tight text-black dark:text-zinc-50">
            麻雀スコアデータ
          </h1>

          <section className="mt-4 w-full">
            <h2 className="text-xl font-bold mb-2 text-black dark:text-zinc-50">
              参加メンバー ({members.length} 人)
            </h2>
            <ul className="grid grid-cols-2 gap-2 text-zinc-600 dark:text-zinc-400">
              {members.length > 0 ? (
                members.map((member) => (
                  <li key={member.id} className="truncate p-1 bg-zinc-100 dark:bg-zinc-800 rounded-md">
                    <span className="font-medium text-black dark:text-zinc-50">{member.name}</span>
                  </li>
                ))
              ) : (
                <li>メンバーがいません。</li>
              )}
            </ul>
          </section>

          <section className="mt-8 w-full">
            <h2 className="text-xl font-bold mb-2 text-black dark:text-zinc-50">
              最近のセッション ({sessions.length} 件)
            </h2>
            <ul className="space-y-2 text-zinc-600 dark:text-zinc-400">
              {sessions.length > 0 ? (
                sessions.map((session) => (
                  <li key={session.id} className="p-2 border rounded-lg dark:border-zinc-700">
                    <Link href={`/mahjong_sessions/${session.id}`} className="font-medium text-black dark:text-zinc-50">{session.title}</Link>
                  </li>
                ))
              ) : (
                <li>セッションの記録がありません。</li>
              )}
            </ul>
          </section>
        </div>
      </main>
    </div>
  );
}
